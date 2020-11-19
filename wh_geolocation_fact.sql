SELECT *, GENERATE_UUID() as geolocation_id FROM `ra-development.rob_training.geolocation_fact` group by 1,2,3,4,5
