# Coding Assignment 

## Instructions 

We'd like to see how you write code in response to a problem. This should take about 2 hours, and you have 24 hours to complete it. If you need more time, or the next 24 hours aren't convenient for you, just let us know. 

You're going to create a Laravel application that satisfies the problem's requirements. You should commit your submission to GitHub when you're done and reply with the link to your repository. No need to make multiple commits as you work (one big commit is fine). 

### Technical requirements 

+ Use the latest version of Laravel (6.0 or later) 

+ If any tables need to be created, use migrations. 

+ Don't worry too much about front-end style and design. 

+ Feel free to make any assumptions you think are missing from the assignment. As written, this assignment should include all information you need. 

+ No authentication is needed, assuming this will be hosted on the company's trusted intranet. 

+ Automated tests aren't required, but you can add some if you'd like. 

We'll check out your project, run composer install, and try it out. 

## Problem 

We're operating a medical center named Axxess Healthcare Center that allows patients to visit for their medical examinations and treatments. 

You're provided a list of existing patients as follows: 

| id | name | age | phone | start_date | follow_up |
|---|---|---|---|---|---|
| 1 | Arlie Watsica V | 65 | (883) 939-9096 | 2019-03-15 |
| 2 | Rose Kerluke | 21 | 560.442.9308 x322 | 2019-01-17 |
| 3 | Annalise Kiehn | 53 | 930.981.4965 | 2019-03-03 |
| 4 | Mr. Richie White DVM | 44 | 941-307-8301 x991 | 2019-02-02 |
| 5 | Clarabelle Borer | 43 | 1-608-317-5912 x746 | 2019-01-12 | 
| 6 | Prof. Angie Ledner II | 71 | 281-245-2558 x908 | 2019-01-14 |
| 7 | Jolie Hamill | 10 | 464.606.1619 | 2019-01-04 | 
| 8 | Xander Gorczany | 68 | (517) 480-7381 x35696 | 2019-04-05 |
| 9 | Dawn Koelpin | 48 | 410.232.1465 x768 | 2019-02-17 |
| 10 | Breanna Cremin | 16 | (716) 307-1968 | 2018-12-11 |
          

### Requirements 

1. Create a user-facing page on route GET /signup that displays a form to add a new patient. The form will make a request to POST /signup that handles patient creation. 

2. Create a user-facing page on route GET /visit that displays a form to add a visit for an existing patient. The form takes in the patient ID and the visit date as input, and will make a request to POST /visit that handles visit creation. 

3. Each patient has a start date field (start_date) that denotes their initial contact with our center. Each patient has a deadline, which is 90 days after this start date, and is expected to have a visit before this deadline. 

Create a user-facing page on route GET /upcoming that displays a list of every patient having their visit deadline within 4 weeks from today. Also, for each patient, display the remaining days counting from today to that deadline. 

4. Create a mechanism to process missed visits. You can either create a command, job, or a web route, etc. for this. This will retrieve all patients that missed a visit by the deadline and record the string missed in the follow_up field of these patients. 

5. Create an API route GET /missed that returns the list of patients that missed their visits in JSON format. 

Example return: 
```
{ 
  "status": "success", 
  "data": [ 
    { 
      "id": 7, 
      "name": "Jolie Hamill", 
      "age": 10, 
      "start_date ": "2019-01-04", 
      "deadline": "2019-04-04" 
    }, 
    { 
      "id": 10, 
      "name": "Breanna Cremin", 
      "age": 16, 
      "start_date ": "2018-12-11", 
      "deadline": "2019-03-11" 
    } 
  ] 
} 
```
