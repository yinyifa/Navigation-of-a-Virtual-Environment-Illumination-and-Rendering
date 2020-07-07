
using UnityEngine;
using System.Collections;

public class InputMethod : MonoBehaviour
{
    public string show = "";

    void Update()
    {

        if (Input.GetMouseButtonDown(0))
        {
            show += "left mouse";
        }

        if (Input.GetMouseButtonUp(0))
        {
            show = "";
        }

        if (Input.GetKeyDown(KeyCode.W))
        {
            show += " + W";
        }

        if (Input.GetKeyUp(KeyCode.W))
        {
            show = "";
        }

        if (Input.GetKeyDown(KeyCode.A))
        {
            show += " + A";
        }
        if (Input.GetKeyUp(KeyCode.A))
        {
            show = "";
        }
        if (Input.GetKeyDown(KeyCode.S))
        {
            show += " + S";
        }
        if (Input.GetKeyUp(KeyCode.S))
        {
            show = "";
        }
        if (Input.GetKeyDown(KeyCode.D))
        {
            show += " + D";
        }
        if (Input.GetKeyUp(KeyCode.D))
        {
            show = "";
        }
        if (Input.GetKeyDown(KeyCode.Q))
        {
            show += " + Q";
        }
        if (Input.GetKeyUp(KeyCode.Q))
        {
            show = "";
        }
        if (Input.GetKeyDown(KeyCode.E))
        {
            show += " + E";
        }
        if (Input.GetKeyUp(KeyCode.E))
        {
            show = "";
        }



    }
}