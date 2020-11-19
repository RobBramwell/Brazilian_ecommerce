select *, GENERATE_UUID() as order_review_pk from `ra-development.rob_training.order_reviews_fact` group by 1,2,3,4,5,6,7
