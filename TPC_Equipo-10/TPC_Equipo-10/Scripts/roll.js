
const createSketch = (parentID, hiddenFieldID) => {
    return (p) => {

        let size = 180;
        let g;

        let flag;
        let angleX = 0, angleY = 0, angleZ = 0;
        let targetAngleX, targetAngleY, targetAngleZ;
        let rolling;
        let rollDuration = 0.05;
        let timer;
        let num;

        p.setup = () => {
            p.createCanvas(size, size).parent(parentID);

            g = p.createGraphics(size, size, p.WEBGL);

            g.strokeWeight(5);
            g.stroke(200);

            p.textFont('Courier New');

            p.textSize(64);
            p.textAlign(p.CENTER, p.CENTER);
        };

        p.draw = () => {
            g.background(255);

            g.push();

            g.angleMode(g.RADIANS)
            g.rotateX(angleX);
            g.rotateY(angleY);
            g.rotateZ(angleZ);

            g.angleMode(g.DEGREES);
            g.rotateX(69);

            g.scale(0.4);

            if (!flag) {
                if (p.mouseX > 0 && p.mouseX < p.width &&
                    p.mouseY > 0 && p.mouseY < p.height) {
                    g.stroke(175);
                    g.fill(200);
                }
                else {
                    g.stroke(200);
                    g.fill(225);
                }
            }
            else {
                g.stroke(200);
                g.fill(225);
            }

            let phi = (1 + p.sqrt(5)) / 2;

            let vertices = [
                p.createVector(-1, phi, 0),
                p.createVector(1, phi, 0),
                p.createVector(-1, -phi, 0),
                p.createVector(1, -phi, 0),
                p.createVector(0, -1, phi),
                p.createVector(0, 1, phi),
                p.createVector(0, -1, -phi),
                p.createVector(0, 1, -phi),
                p.createVector(phi, 0, -1),
                p.createVector(phi, 0, 1),
                p.createVector(-phi, 0, -1),
                p.createVector(-phi, 0, 1)
            ];

            for (let v of vertices) {
                v.normalize();
                v.mult(200);
            }

            let faces = [
                [0, 11, 5], [0, 5, 1], [0, 1, 7], [0, 7, 10], [0, 10, 11],
                [1, 5, 9], [5, 11, 4], [11, 10, 2], [10, 7, 6], [7, 1, 8],
                [3, 9, 4], [3, 4, 2], [3, 2, 6], [3, 6, 8], [3, 8, 9],
                [4, 9, 5], [2, 4, 11], [6, 2, 10], [8, 6, 7], [9, 8, 1]
            ];

            g.beginShape(g.TRIANGLES);
            for (let f of faces) {
                let v1 = vertices[f[0]];
                let v2 = vertices[f[1]];
                let v3 = vertices[f[2]];
                g.vertex(v1.x, v1.y, v1.z);
                g.vertex(v2.x, v2.y, v2.z);
                g.vertex(v3.x, v3.y, v3.z);
            }
            g.endShape();
            g.pop();

            p.image(g, 0, 0);

            p.fill(0, 0, 0, timer / 8 - 100);
            if (num) {
                p.text(num, p.width / 2, p.height / 2);
            }

            if (rolling) {
                angleX = p.lerp(angleX, targetAngleX, rollDuration);
                angleY = p.lerp(angleY, targetAngleY, rollDuration);
                angleZ = p.lerp(angleZ, targetAngleZ, rollDuration);

                timer += p.deltaTime;

                if (
                    p.abs(angleX - targetAngleX) < 0.001 &&
                    p.abs(angleY - targetAngleY) < 0.001 &&
                    p.abs(angleZ - targetAngleZ) < 0.001
                ) {
                    rolling = false;
                }
            }
        };

        p.mousePressed = () => {
            if (p.mouseX > 0 && p.mouseX < p.width &&
                p.mouseY > 0 && p.mouseY < p.height) {
                if (!flag) {
                    flag = true;
                    p.rollDice();
                }
            }
        }

        p.rollDice = () => {

            timer = 0;
            p.background(255);
            do {
                targetAngleX = p.floor(p.random(3)) * 4 * p.HALF_PI;
                targetAngleY = p.floor(p.random(3)) * 4 * p.HALF_PI;
                targetAngleZ = p.floor(p.random(3)) * 4 * p.HALF_PI;
            }
            while (targetAngleX == angleX || targetAngleY == angleY || targetAngleZ == angleZ);
            
            rolling = true;

            let d6s = [];

            d6s.push(p.floor(p.random(6) + 1));
            d6s.push(p.floor(p.random(6) + 1));
            d6s.push(p.floor(p.random(6) + 1));
            d6s.push(p.floor(p.random(6) + 1));

            let minv = 7;
            let mini;

            for (let i = 0; i < 4; i++) {
                if (d6s[i] < minv) {
                    minv = d6s[i];
                    mini = i;
                }
            }
            d6s.splice(mini, 1);

            num = d6s[0] + d6s[1] + d6s[2];

            document.getElementById('ContentPlaceHolder1_' + hiddenFieldID).value = num;
            let fieldCounter = document.getElementById('ContentPlaceHolder1_fieldCounter');

            if (!fieldCounter.value) {
                fieldCounter.value = 1;
            }
            else {
                fieldCounter.value = parseInt(fieldCounter.value) + 1;
            }

            if (fieldCounter.value == '6') {
                let linkButton = document.getElementById('ContentPlaceHolder1_btnConfirm1');
                linkButton.classList.remove('disabled');
            }
        };
    };
};

new p5(createSketch('rollSTR', 'fieldSTR'));
new p5(createSketch('rollDEX', 'fieldDEX'));
new p5(createSketch('rollCON', 'fieldCON'));
new p5(createSketch('rollINT', 'fieldINT'));
new p5(createSketch('rollWIS', 'fieldWIS'));
new p5(createSketch('rollCHA', 'fieldCHA'));