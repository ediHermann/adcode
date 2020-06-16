module.exports=
{
    "routes": [
    {
      "method": "GET",
      "path": "/user-spot-talent/:uid",
      "handler": "UserSpotTalent.find",
      "config": {
        "policies": []
       }
    },
      {
      "method": "POST",
      "path": "/user-spot-talent",
      "handler": "UserSpotTalent.create",
      "config": {
      "policies": []
        }
    },
      {
        "method": "PUT",
        "path": "/user-spot-talent/:id",
        "handler": "UserSpotTalent.update",
        "config": {
          "policies": []
        }
      },
      {
        "method": "DELETE",
        "path": "/user-spot-talent/:id",
        "handler": "UserSpotTalent.delete",
        "config": {
          "policies": []
        }
      }

  ]
}
