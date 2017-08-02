using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerBoxScript : MonoBehaviour {

    public GameObject parent;

    public bool alreadyActivated = false;

    void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player" && alreadyActivated == false)
        {
            EnemySpawner spawner = parent.GetComponent<EnemySpawner>();
            spawner.SpawnMethod = SpawnType.Timer;
            for(int i = 0; i < spawner.TriggerBoxes.Length; i++)
            {
                spawner.TriggerBoxes[i].GetComponent<TriggerBoxScript>().alreadyActivated = true;
            }
        }
    }
}
