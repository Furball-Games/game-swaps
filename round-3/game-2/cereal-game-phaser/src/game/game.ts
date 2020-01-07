import 'phaser';
import { World1Scene } from "./scenes/world1.scene";

window.onload = () => {
    const game = new Phaser.Game({
        type: Phaser.AUTO,
        width: 1024,
        height: 768,
        scene: [
            World1Scene
        ],
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
