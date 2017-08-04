using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[SerializeField]
public class TriggerBoxScript : MonoBehaviour {

    public List<GameObject> parent = new List<GameObject>();

    public bool alreadyActivated = false;



    void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player" && alreadyActivated == false)
        { 
            for(int i = 0; i< parent.Count; i++)
            {
                if (parent[i].GetComponent<EnemySpawner>())
                {
                    parent[i].GetComponent<EnemySpawner>().triggerActivate();
                }
            }
        }
    }
}
