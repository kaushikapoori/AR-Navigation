using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class multilanguage : MonoBehaviour
{
   private void Awake()
   {
        LocalizationManager.Read();

        LocalizationManager.Language = "English";
   }
}
