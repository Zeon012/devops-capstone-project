import os
from flask import Flask
from flask_cors import CORS
from flask_talisman import Talisman


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=False)
    
    # Test mode configuration
    if test_config:
        app.config.update(test_config)

    # CORS (allow all for scaffold; tighten in production)
    CORS(app)

    # Security headers via Talisman
    # Allow HTTP in development (FLASK_ENV=development) or testing
    force_https = not (
        app.config.get('TESTING', False) or 
        os.environ.get('FLASK_ENV') == 'development'
    )
    Talisman(app, content_security_policy=None, force_https=force_https)

    # Register blueprints
    from .routes import bp as accounts_bp
    app.register_blueprint(accounts_bp)

    return app
