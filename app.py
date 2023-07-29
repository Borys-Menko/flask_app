from project import create_app
import os
import logging

app = create_app()
logger = logging.getLogger(__name__)

if __name__ == "__main__":
    f = open("/app/volum/welcomeHome.txt", "a")
    f.write("HEY IM COMMAND FROM CONTAINER")
    f.close()
    app.run(debug=os.getenv("DEBUG_MODE"), host="0.0.0.0")
