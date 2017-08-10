using UnityEngine.SceneManagement;
using UnityEngine;

public class Controller : MonoBehaviour {

    public void Restart()
    {
        SceneManager.LoadScene("Level1_Blockout", LoadSceneMode.Single);
    }
}
