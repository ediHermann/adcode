module.exports=
{
    "routes": [
    {
      "method": "GET",
      "path": "/user-spot-broadcast/:uid",
      "handler": "UserSpotBroadcast.find",
      "config": {
        "policies": []
       }
    },
      {
      "method": "POST",
      "path": "/user-spot-broadcast",
      "handler": "UserSpotBroadcast.create",
      "config": {
      "policies": []
        }
    },
      {
        "method": "PUT",
        "path": "/user-spot-broadcast/:id",
        "handler": "UserSpotBroadcast.update",
        "config": {
          "policies": []
        }
      },
      {
        "method": "DELETE",
        "path": "/user-spot-broadcast/:id",
        "handler": "UserSpotBroadcast.delete",
        "config": {
          "policies": []
        }
      }

  ]
}
