module.exports=
{
    "routes": [
    {
      "method": "GET",
      "path": "/user-profile",
      "handler": "UserProfile.findOne",
      "config": {
        "policies": []
       }
    },
      {
      "method": "PUT",
      "path": "/user-profile",
      "handler": "UserProfile.update",
      "config": {
      "policies": []
        }
    }

  ]
}
