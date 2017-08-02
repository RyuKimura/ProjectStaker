using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName ="AI/Actions/Attack")]
public class AttackAction : Actions {

    public override void Act(StateController controller)
    {
        Attack(controller);
    }

    void Attack(StateController controller)
    {
        controller.GetComponent<MeshRenderer>().material.color = Color.red;
    }
}
