class Members::ApplicationController < ApplicationController

before_filter :authenticate_member!


end