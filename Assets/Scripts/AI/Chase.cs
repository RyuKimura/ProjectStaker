using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName ="AI/Actions/Chase")]
public class Chase : Actions {

    public override void Act(StateController controller)
    {
        ChaseAction(controller);
    }

    private void ChaseAction(StateController controller)
    {
        controller.navMeshAgent.destination = controller.chaseTarget.position;
        controller.navMeshAgent.Resume();
    }
}
