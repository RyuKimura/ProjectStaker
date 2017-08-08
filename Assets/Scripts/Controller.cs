using UnityEngine.SceneManagement;
using UnityEngine;

public class Controller : MonoBehaviour {

    public void Restart()
    {
        SceneManager.LoadScene("RyutoScene", LoadSceneMode.Single);
    }
}
