# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

####
Path to Sign In/Up Admin User:- http://localhost:3000/admin_users/sign_in
Path to Sign In/Up Customer:- http://localhost:3000/customers/sign_in
1) In Cart if adding same product again with same customization then update the count of exist cart item can achieve this while adding cart item in DB through API.
2) On price Update of product, part or combination either make the cart item invalid to process further ask user to add again or silently update the cart_item price through background jobs.
3) Can customize the devise view for sign in/up flow.
4) On Cart Checkout take the customer for payment
