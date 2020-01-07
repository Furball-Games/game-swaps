import Scene = Phaser.Scene;
import GameObject = Phaser.GameObjects.GameObject;

export interface State {
    stateMachine: StateMachine;

    enter(scene: Scene, gameObject: GameObject);
    execute(scene: Scene, gameObject: GameObject);
}

export class StateMachine {
    initialState: string;
    possibleStates: { [key: string]: State };
    scene: Scene;
    gameObject: GameObject;
    state: string;

    constructor(scene: Scene, gameObject: GameObject, initialState: string, possibleStates: { [key: string]: State }) {
        this.initialState = initialState;
        this.possibleStates = possibleStates;
        this.scene = scene;
        this.gameObject = gameObject;

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
            this.possibleStates[this.state].enter(this.scene, this.gameObject);
        }

        // Run the current state's execute
        this.possibleStates[this.state].execute(this.scene, this.gameObject);
    }

    transition(newState, ...enterArgs) {
        this.state = newState;
        this.possibleStates[this.state].enter(this.scene, this.gameObject);
    }
}
