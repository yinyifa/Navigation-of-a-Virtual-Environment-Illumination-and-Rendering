using UnityEngine;
using UnityEngine.UI;

namespace A05
{
    public class showEvent : MonoBehaviour
    {
        public void Awake()
        {
            Text txt = transform.Find("Text").GetComponent<Text>();
            //string s = txt.text;

             txt.text = "activated mouse/keyboard event info";
            
        }




        public void Update()
        {
            Text txt = transform.Find("Text").GetComponent<Text>();
            var charControl = GameObject.Find("EventSystem").GetComponent<InputMethod>();
            string s = charControl.show;

            txt.text = s;

        }
    }
}