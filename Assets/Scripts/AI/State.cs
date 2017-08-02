using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[CreateAssetMenu(menuName ="AI/State")]
public class State : ScriptableObject {

    public Actions[] actions;
    public Transition[] transition;

    public void UpdateState(StateController controller)
    {
        doActions(controller);
        CheckTransitions(controller);
    }

    void doActions(StateController controller)
    {
        for (int i = 0; i < actions.Length; i++)
        {
            actions[i].Act(controller);
        }
    }

    void CheckTransitions(StateController controller)
    {
        for (int i = 0; i < transition.Length; i++)
        {
            bool decisionSucceeded = transition[i].decision.Decide(controller);

            if (decisionSucceeded)
            {
                controller.TransitionToState(transition[i].trueState);
            }
            else
            {
                controller.TransitionToState(transition[i].falseState);
            }
        }
    }

}
