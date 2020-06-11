module.exports=
{
    "routes": [
    {
      "method": "GET",
      "path": "/user-spots",
      "handler": "UserSpot.find",
      "config": {
        "policies": []
       }
    },
      {
      "method": "POST",
      "path": "/user-spots",
      "handler": "UserSpot.create",
      "config": {
      "policies": []
        }
    },
      {
        "method": "PUT",
        "path": "/user-spots/:uid",
        "handler": "UserSpot.update",
        "config": {
          "policies": []
        }
      },
      {
        "method": "DELETE",
        "path": "/user-spots/:uid",
        "handler": "UserSpot.delete",
        "config": {
          "policies": []
        }
      }

  ]
}
