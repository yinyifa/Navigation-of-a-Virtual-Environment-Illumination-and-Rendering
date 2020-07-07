using UnityEngine;
using System.Collections;
// learn from one Unity tutorial
public class cm : MonoBehaviour
{

    public float cameraMoveSpeed = 10f;
    public float cameraRotSpeed = 30f;
    //bool isRotateCamera = false;

    //private float trans_y = 0;
    //private float trans_x = 0;
    //private float trans_z = 0;

    private float eulerAngles_x;
    private float eulerAngles_y;

    void Start()
    {

        Vector3 eulerAngles = this.transform.eulerAngles;

        this.eulerAngles_x = eulerAngles.y;

        this.eulerAngles_y = eulerAngles.x;
    }

    // mouse event operation
    void FixedUpdate()
    {


        if (Input.GetMouseButton(0))
        {

            this.eulerAngles_x += (Input.GetAxis("Mouse X") * this.cameraRotSpeed) * Time.deltaTime;

            this.eulerAngles_y -= (Input.GetAxis("Mouse Y") * this.cameraRotSpeed) * Time.deltaTime;

            Quaternion quaternion = Quaternion.Euler(this.eulerAngles_y, this.eulerAngles_x, (float)0);

            this.transform.rotation = quaternion;

            moveCameraByKey(cameraMoveSpeed);
        }


        //this.trans_z = (Input.GetAxis("Mouse ScrollWheel") * this.cameraMoveSpeed * 2) * Time.deltaTime;
        //this.transform.Translate(Vector3.forward * this.trans_z);
    }

    // keyboard event operation
    void moveCameraByKey(float speed)
    {

        if (Input.GetKey(KeyCode.Q))
        {
            this.transform.Translate(Vector3.down * speed * Time.deltaTime);
        }

        if (Input.GetKey(KeyCode.E))
        {
            this.transform.Translate(Vector3.up * speed * Time.deltaTime);
        }

        float moveV = Input.GetAxis("Vertical");
        float moveH = Input.GetAxis("Horizontal");

        this.transform.Translate(Vector3.forward * speed * moveV * Time.deltaTime + Vector3.right * speed * moveH * Time.deltaTime);
    }
}