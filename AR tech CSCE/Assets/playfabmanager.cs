using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using PlayFab;
using PlayFab.ClientModels;
using Newtonsoft.Json;
using UnityEngine.UI;

public class playfabmanager : MonoBehaviour
{
    [Header("UI")]
    public Text messagetext;
    public InputField emailInput;
    public InputField passwordoutput;

    public void RegisterButton() {
        var request = new RegisterPlayFabUseRequest {
            Email = emailInput.text,
            Password = passwordInput.text,
            RequireBothUsernameandEmail = fans
        };
        PlayFabClientAPI.RegisterPlayFabUser(request, OnRegisterSuccess,OnError);

     }
     void OnRegisterSuccess(RegisterPlayFabUseResult result){
            messageText.text = "Registered and Logged in";
     }
     
}
