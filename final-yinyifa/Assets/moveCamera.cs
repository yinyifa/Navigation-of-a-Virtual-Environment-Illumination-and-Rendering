using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace A05
{
    public class moveCamera : MonoBehaviour
    {
        //[SerializeField] private Transform cameraTransform;

        // to set the world position of the camera to (x,y,z),
        // and rotate about its own center by Euler angles
        //    ( rotationAngleX, rotationAngleY, rotationAngleZ )

        // hint 1: first just change position, and leave the rotation Quaternion as it is:
        [Range(1f, 20f)] [SerializeField] private float speed = 5f;
        private void Start()
        {

            this.transform.LookAt(new Vector3(0f, 0f, 0f));

        }

        private void Update()
        {
            //Quaternion quatCamera = cameraTransform.rotation;
            //Vector3 posCamera = new Vector3(x, y, z);
            //cameraTransform.SetPositionAndRotation(posCamera, quatCamera);

            // hint 2: then, you could set any of the camera's Euler rotation angles:
            //cameraTransform.Rotate(rotationAngleX, rotationAngleY, rotationAngleZ, Space.Self);

            // hint 3: *instead* of calling cameraTransform.Rotate() as shown at above hint 2,
            //         you may use Unity's LookAt method instead,
            //         to orient the camera towards the model, e.g.:
            //cameraTransform.LookAt(cameraTransform);
            //var charControl = GameObject.Find("Spline Segment").GetComponent<SplineSegmentGPUCompute>();
            //var ;
            //if (txt.text == "first derivatives: on")
            this.transform.RotateAround(new Vector3(0f, 0f, 0f), new Vector3(0f, 1f, 0f), speed * Time.deltaTime);
            // for more about positioning the camera, please see Lecture 25 A notes
        }
    }
}