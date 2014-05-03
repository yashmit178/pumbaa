from mongoengine import connect

from .users import User, Role, Profile, Approver
from .forums import Topic, Comment, Forum, TopicHistory
from .photos import PhotoAlbum, Photo
from .calendars import Event

def initial(settings):
    connect(settings.get('mongodb.db_name'), host=settings.get('mongodb.host'))
