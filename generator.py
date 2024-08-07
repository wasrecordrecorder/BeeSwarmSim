# generator.py
import requests
import random
import string

def generate_code(length=22):
    return ''.join(random.choices(string.digits, k=length))

def send_to_discord(webhook_url, code):
    data = {
        "content": f"New code generated: {code}"
    }
    response = requests.post(webhook_url, json=data)
    if response.status_code == 204:
        print("Code sent to Discord successfully.")
    else:
        print(f"Failed to send code to Discord: {response.status_code}")

if __name__ == "__main__":
    webhook_url = "https://discord.com/api/webhooks/1270755667149590538/9DAwK79Z8iyvYNYAD0yOAtchgVo7lERxPVbTmiI7lPqgROETlLDmvpotIP6qDkA3-_KK"
    code = generate_code()
    send_to_discord(webhook_url, code)
    print(f"Generated code: {code}")