import { PlayerSprite } from '../objects/player.sprite';
import { StateMachine } from '../states/state-machine';
import { YellowState } from '../objects/player-states/yellow.state';
import { BlueState } from '../objects/player-states/blue.state';
import { RedState } from '../objects/player-states/red.state';

import CursorKeys = Phaser.Types.Input.Keyboard.CursorKeys;

export class World1Scene extends Phaser.Scene {
    player: PlayerSprite;
    playerStateMachine: StateMachine;
    keys: CursorKeys;

    preload() {
        this.load.image('spr_player', 'assets/images/spr_player.png');
    }

    create() {
        this.keys = this.input.keyboard.createCursorKeys();

        this.player = new PlayerSprite(this, 100, 100, 'spr_player')

        this.playerStateMachine = new StateMachine(this, this.player, 'blue', {
            blue: new BlueState(),
            red: new RedState(),
            yellow: new YellowState()
        });
    }

    update() {
        this.playerStateMachine.step();
    }
}
