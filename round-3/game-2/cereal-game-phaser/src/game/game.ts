import * as Phaser from "phaser";

window.onload = () => {
    const game = new Phaser.Game({
        type: Phaser.AUTO,
        width: 1024,
        height: 768,
        scene: [],
        render: {
            antialias: false
        },
        physics: {
            default: 'arcade',
            arcade: {
                gravity: { y: 1000 },
                debug: false
            }
        }
    });
};
