using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


public class StateController : MonoBehaviour {

    public State currentState;
    public State remainState;
    public Transform chaseTarget;
    public NavMeshAgent navMeshAgent;
    public float stateTimeElapsed;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        currentState.UpdateState(this);
	}

    public void TransitionToState(State nextState)
    {
        if(nextState != remainState)
        {
            currentState = nextState;
            OnExitState();
        }
    }

    public bool CheckIfCounDownElapsed(float duration)
    {
        stateTimeElapsed += Time.deltaTime;
        return stateTimeElapsed >= duration;
    }

    void OnExitState()
    {
        stateTimeElapsed = 0;
    }
}
