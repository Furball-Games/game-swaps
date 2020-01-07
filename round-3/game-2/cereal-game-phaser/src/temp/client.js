/* global Phaser */

class StateMachine {
    constructor(initialState, possibleStates, stateArgs=[]) {
        this.initialState = initialState;
        this.possibleStates = possibleStates;
        this.stateArgs = stateArgs;
        this.state = null;

        // State instances get access to the state machine via this.stateMachine.
        for (const state of Object.values(this.possibleStates)) {
            state.stateMachine = this;
        }
    }

    step() {
        // On the first step, the state is null and we need to initialize the first state.
        if (this.state === null) {
            this.state = this.initialState;
            this.possibleStates[this.state].enter(...this.stateArgs);
        }

        // Run the current state's execute
        this.possibleStates[this.state].execute(...this.stateArgs);
    }

    transition(newState, ...enterArgs) {
        this.state = newState;
        this.possibleStates[this.state].enter(...this.stateArgs, ...enterArgs);
    }
}

class State {
    enter() {

    }

    execute() {

    }
}


const config = {
    type: Phaser.AUTO,
    width: 400,
    height: 300,
    pixelArt: true,
    zoom: 2,
    physics: {
        default: 'arcade'
    },
    scene: {
        preload() {
            this.load.spritesheet('hero', 'https://cdn.glitch.com/59aa1c5f-c16d-41a1-bfd2-09072e84a538%2Fhero.png?1551136698770', {
                frameWidth: 32,
                frameHeight: 32,
            });
            this.load.image('bg', 'https://cdn.glitch.com/59aa1c5f-c16d-41a1-bfd2-09072e84a538%2Fbg.png?1551136995353');
        },

        create() {
            this.keys = this.input.keyboard.createCursorKeys();

            // Static background
            this.add.image(200, 200, 'bg');

            // The movable character
            this.hero = this.physics.add.sprite(200, 150, 'hero', 0);
            this.hero.direction = 'down';

            // The state machine managing the hero
            this.stateMachine = new StateMachine('idle', {
                idle: new IdleState(),
                move: new MoveState(),
                swing: new SwingState(),
                dash: new DashState(),
            }, [this, this.hero]);


            // Animation definitions
            this.anims.create({
                key: 'walk-down',
                frameRate: 8,
                repeat: -1,
                frames: this.anims.generateFrameNumbers('hero', {start: 0, end: 3}),
            });
            this.anims.create({
                key: 'walk-right',
                frameRate: 8,
                repeat: -1,
                frames: this.anims.generateFrameNumbers('hero', {start: 4, end: 7}),
            });
            this.anims.create({
                key: 'walk-up',
                frameRate: 8,
                repeat: -1,
                frames: this.anims.generateFrameNumbers('hero', {start: 8, end: 11}),
            });
            this.anims.create({
                key: 'walk-left',
                frameRate: 8,
                repeat: -1,
                frames: this.anims.generateFrameNumbers('hero', {start: 12, end: 15}),
            });

            // NOTE: Sword animations do not repeat
            this.anims.create({
                key: 'swing-down',
                frameRate: 8,
                repeat: 0,
                frames: this.anims.generateFrameNumbers('hero', {start: 16, end: 19}),
            });
            this.anims.create({
                key: 'swing-up',
                frameRate: 8,
                repeat: 0,
                frames: this.anims.generateFrameNumbers('hero', {start: 20, end: 23}),
            });
            this.anims.create({
                key: 'swing-right',
                frameRate: 8,
                repeat: 0,
                frames: this.anims.generateFrameNumbers('hero', {start: 24, end: 27}),
            });
            this.anims.create({
                key: 'swing-left',
                frameRate: 8,
                repeat: 0,
                frames: this.anims.generateFrameNumbers('hero', {start: 28, end: 31}),
            });
        },

        update() {
            this.stateMachine.step();
        },
    }
};

class IdleState extends State {
    enter(scene, hero) {
        hero.setVelocity(0);
        hero.anims.play(`walk-${hero.direction}`);
        hero.anims.stop();
    }

    execute(scene, hero) {
        const {left, right, up, down, space, shift} = scene.keys;

        // Transition to swing if pressing space
        if (space.isDown) {
            this.stateMachine.transition('swing');
            return;
        }

        // Transition to dash if pressing shift
        if (shift.isDown) {
            this.stateMachine.transition('dash');
            return;
        }

        // Transition to move if pressing a movement key
        if (left.isDown || right.isDown || up.isDown || down.isDown) {
            this.stateMachine.transition('move');
            return;
        }
    }
}

class MoveState extends State {
    execute(scene, hero) {
        const {left, right, up, down, space, shift} = scene.keys;

        // Transition to swing if pressing space
        if (space.isDown) {
            this.stateMachine.transition('swing');
            return;
        }

        // Transition to dash if pressing shift
        if (shift.isDown) {
            this.stateMachine.transition('dash');
            return;
        }

        // Transition to idle if not pressing movement keys
        if (!(left.isDown || right.isDown || up.isDown || down.isDown)) {
            this.stateMachine.transition('idle');
            return;
        }

        hero.setVelocity(0);
        if (up.isDown) {
            hero.setVelocityY(-100);
            hero.direction = 'up';
        } else if (down.isDown) {
            hero.setVelocityY(100);
            hero.direction = 'down';
        }
        if (left.isDown) {
            hero.setVelocityX(-100);
            hero.direction = 'left';
        } else if (right.isDown) {
            hero.setVelocityX(100);
            hero.direction = 'right';
        }

        hero.anims.play(`walk-${hero.direction}`, true);
    }
}

class SwingState extends State {
    enter(scene, hero) {
        hero.setVelocity(0);
        hero.anims.play(`swing-${hero.direction}`);
        hero.once('animationcomplete', () => {
            this.stateMachine.transition('idle');
        });
    }
}

class DashState extends State {
    enter(scene, hero) {
        hero.setVelocity(0);
        hero.anims.play(`swing-${hero.direction}`);
        switch (hero.direction) {
            case 'up':
                hero.setVelocityY(-300);
                break;
            case 'down':
                hero.setVelocityY(300);
                break;
            case 'left':
                hero.setVelocityX(-300);
                break;
            case 'right':
                hero.setVelocityX(300);
                break;
        }

        // Wait a third of a second and then go back to idle
        scene.time.delayedCall(300, () => {
            this.stateMachine.transition('idle');
        });
    }
}

window.game = new Phaser.Game(config);
