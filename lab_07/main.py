import requests
import sys


def get_ip():
    api_url = "https://api.ipify.org/?format=json"
    response = requests.get(api_url)
    content = response.json()
    return content["ip"]


def get_recipe():
    api_url = "https://themealdb.com/api/json/v1/1/random.php"
    response = requests.get(api_url)
    content = response.json()
    meal = content["meals"][0]
    return meal["strMeal"] + "\n" + meal["strInstructions"]


def get_number_fact():
    api_url = "http://numbersapi.com/random/trivia"
    response = requests.get(api_url)
    return response.text


def main():
    function = sys.argv[1]
    if function == "get_ip":
        print("Your public IP address is: " + get_ip())
    elif function == "get_recipe":
        print("Here's a random recipe: " + get_recipe())
    elif function == "get_number_fact":
        print("Here's a random number fact: " + get_number_fact())
    else:
        print("Invalid function")


if __name__ == "__main__":
    main()
