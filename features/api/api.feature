Feature: API

  Scenario: Case 1
    Given I send and accept JSON
    When I send a POST request to "/api/timeslot" with the following:
      """
      {"timeslot":{ "start_time":"1406052000", "duration":"120" }}
      """
    And I send a POST request to "/api/boat" with the following:
      """
      {"boat":{"capacity": "8", "name": "Amazon Express" }}
      """
    And I send a POST request to "/api/boat" with the following:
      """
      {"boat":{"capacity": "4", "name": "Amazon Express Mini" }}
      """
    And I send a POST request to "/api/assignment" with the following:
      """
      {"assignment":{"timeslot_id": "1", "boat_id": "1" }}
      """
    And I send a POST request to "/api/assignment" with the following:
      """
      {"assignment":{"timeslot_id": "1", "boat_id": "2" }}
      """
    And I send a GET request to "/api/timeslots" with the following:
      """
      {"timeslot":{"date": "2014-07-22" }}
      """
    Then the JSON response should be:
      """
      [{    "id": 1,
            "start_time": 1406052000,
            "duration": 120,
            "availability": 8,
            "customer_count": 0,
            "boats": [1,2]
            }]
      """
    Then I send a POST request to "/api/booking" with the following:
      """
      {"booking":{"timeslot_id": "1", "size": "6" }}
      """
    And I send a GET request to "/api/timeslots" with the following:
      """
      {"timeslot":{"date": "2014-07-22" }}
      """
    Then the JSON response should be:
      """
      [{    "id": 1,
            "start_time": 1406052000,
            "duration": 120,
            "availability": 4,
            "customer_count": 6,
            "boats": [1,2]
            }]
      """

  Scenario: Case 2
    Given I send and accept JSON
    When I send a POST request to "/api/timeslot" with the following:
      """
      {"timeslot":{ "start_time":"1406052000", "duration":"120" }}
      """
    And I send a POST request to "/api/timeslot" with the following:
      """
      {"timeslot":{ "start_time":"1406055600", "duration":"120" }}
      """
    And I send a POST request to "/api/boat" with the following:
      """
      {"boat":{"capacity": "8", "name": "Amazon Express" }}
      """
    And I send a POST request to "/api/assignment" with the following:
      """
      {"assignment":{"timeslot_id": "2", "boat_id": "3" }}
      """
    And I send a POST request to "/api/assignment" with the following:
      """
      {"assignment":{"timeslot_id": "3", "boat_id": "3" }}
      """
    And I send a GET request to "/api/timeslots" with the following:
      """
      {"timeslot":{"date": "2014-07-22" }}
      """
    Then the JSON response should be:
      """
      [{    "id": 2,
            "start_time": 1406052000,
            "duration": 120,
            "availability": 8,
            "customer_count": 0,
            "boats": [3]
            },
            {"id": 3,
            "start_time": 1406055600,
            "duration": 120,
            "availability": 8,
            "customer_count": 0,
            "boats": [3]
            }]
      """
    # Then I send a POST request to "/api/booking" with the following:
    #   """
    #   {"booking":{"timeslot_id": "2", "size": "2" }}
    #   """
    # And I send a GET request to "/api/timeslots" with the following:
    #   """
    #   {"timeslot":{"date": "2014-07-22" }}
    #   """
    # Then the JSON response should be:
    #   """
    #   [{    "id": 1,
    #         "start_time": 1406052000,
    #         "duration": 120,
    #         "availability": 0,
    #         "customer_count": 0,
    #         "boats": [1]
    #         },
    #         {"id": 2,
    #         "start_time": 1406052000,
    #         "duration": 120,
    #         "availability": 6,
    #         "customer_count": 2,
    #         "boats": [1]
    #         }]
    #   """
