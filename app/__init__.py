from flask import Flask


def create_app(configuration) -> Flask:
    """Initialize the core application"""
    app = Flask(__name__)
    app.config.from_object(configuration)

    @app.route('/')
    def index():
        return f'<p>Hello, World!</p>'

    return app
