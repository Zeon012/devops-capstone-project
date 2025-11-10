from flask import Blueprint, request, jsonify

bp = Blueprint('accounts', __name__)

# Simple in-memory store for scaffold/demo/testing
_ACCOUNTS = {}
_NEXT_ID = 1


def _reset_store():
    global _ACCOUNTS, _NEXT_ID
    _ACCOUNTS = {}
    _NEXT_ID = 1


@bp.route('/accounts', methods=['POST'])
def create_account():
    global _NEXT_ID
    data = request.get_json() or {}
    # Basic validation
    if 'name' not in data:
        return jsonify({'error': 'name is required'}), 400
    account = {
        'id': _NEXT_ID,
        'name': data['name'],
        'email': data.get('email')
    }
    _ACCOUNTS[_NEXT_ID] = account
    _NEXT_ID += 1
    return jsonify(account), 201


@bp.route('/accounts', methods=['GET'])
def list_accounts():
    return jsonify(list(_ACCOUNTS.values())), 200


@bp.route('/accounts/<int:account_id>', methods=['GET'])
def get_account(account_id):
    account = _ACCOUNTS.get(account_id)
    if not account:
        return jsonify({'error': 'not found'}), 404
    return jsonify(account), 200


@bp.route('/accounts/<int:account_id>', methods=['PUT'])
def update_account(account_id):
    account = _ACCOUNTS.get(account_id)
    if not account:
        return jsonify({'error': 'not found'}), 404
    data = request.get_json() or {}
    account['name'] = data.get('name', account['name'])
    account['email'] = data.get('email', account.get('email'))
    _ACCOUNTS[account_id] = account
    return jsonify(account), 200


@bp.route('/accounts/<int:account_id>', methods=['DELETE'])
def delete_account(account_id):
    account = _ACCOUNTS.pop(account_id, None)
    if not account:
        return jsonify({'error': 'not found'}), 404
    return '', 204


# Expose for tests
__all__ = ['bp', '_reset_store', '_ACCOUNTS']
