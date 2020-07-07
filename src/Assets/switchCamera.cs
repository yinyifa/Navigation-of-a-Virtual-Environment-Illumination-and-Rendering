using UnityEngine;
using System.Collections;

// learn from one Unity tutorial
public class switchCamera : MonoBehaviour
{

	public GameObject[] cameras;
	public string[] shotcuts;
	public bool changeAudioListener = true;


	// get key from keyboard, and switch camera
	void Update()
	{
		int i = 0;
		for (i = 0; i < cameras.Length; i++)
		{
			if (Input.GetKeyUp(shotcuts[i]))
				SwitchCamera(i);
		}
	}

	// switch camera: enable i-th camera, and disable other camera. 
	void SwitchCamera(int index)
	{
		int i = 0;
		for (i = 0; i < cameras.Length; i++)
		{
			if (i != index)
			{
				if (changeAudioListener)
				{
					cameras[i].GetComponent<AudioListener>().enabled = false;
				}
				cameras[i].GetComponent<Camera>().enabled = false;
			}
			else
			{
				if (changeAudioListener)
				{
					cameras[i].GetComponent<AudioListener>().enabled = true;
				}
				cameras[i].GetComponent<Camera>().enabled = true;
			}
		}
	}
}