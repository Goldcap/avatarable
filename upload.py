import base64
import twitter
import os
from dotenv import load_dotenv
from pathlib import Path  # python3 only
env_path = Path('.') / '.env'

load_dotenv(verbose=True)

TCK = os.getenv('TCK')
TCS = os.getenv('TCS')
TAT = os.getenv('TAT')
TAS = os.getenv('TAS')

api = twitter.Api(consumer_key=TCK,
                  consumer_secret=TCS,
                  access_token_key=TAT,
                  access_token_secret=TAS)

with open("avatar.png", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

api.UpdateImage("avatar.png")

api.UpdateBanner("collage.png")

with open("saying.txt") as f:
    saying = f.readlines()
    f.close()

desc=" ".join(saying)

api.UpdateProfile(description=desc[-159:])

exit()
