[33mcommit 1f07ea76b3c63e5c6af989e72c23beb9e71f3ed3[m
Author: Sunny Patel <sunsetium@gmail.com>
Date:   Mon Jan 9 17:43:04 2017 -0500

    removed signup option ofadmin code and proceeded with secret page

[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex 54b02f0..994a09c 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -14,10 +14,8 @@[m [mclass ApplicationController < ActionController::Base[m
 [m
 	def require_user[m
 		if !logged_in?[m
[31m-			flash[:danger] = "You must be logged in to perform that action"[m
[32m+[m			[32mflash[:danger] = "You must be logged in to perform that action or have access to that page"[m
 			redirect_to root_path[m
 		end[m
 	end[m
[31m-[m
[31m-	[m
 end[m
[1mdiff --git a/app/controllers/codes_controller.rb b/app/controllers/codes_controller.rb[m
[1mindex 31685e3..27b1dd4 100644[m
[1m--- a/app/controllers/codes_controller.rb[m
[1m+++ b/app/controllers/codes_controller.rb[m
[36m@@ -1,11 +1,20 @@[m
 class CodesController < ApplicationController[m
 [m
  http_basic_authenticate_with :name => "sunny", :password => "asdasd123"[m
[31m-[m
[32m+[m[32mbefore_action :require_same_user, only: [:edit,  :show, :destroy, :index][m
 	def new[m
 		@code = Code.new[m
 	end[m
 [m
[32m+[m	[32mdef index[m
[32m+[m		[32m@codes = Code.all[m
[32m+[m	[32mend[m
[32m+[m
[32m+[m	[32mdef show[m
[32m+[m[41m		[m
[32m+[m	[32mend[m
[32m+[m
[32m+[m
 	def create[m
 		@code = Code.new(code_params)[m
 		if !logged_in?[m
[36m@@ -28,8 +37,21 @@[m [mclass CodesController < ApplicationController[m
 		end[m
 	end[m
 [m
[32m+[m	[32mdef destroy[m
[32m+[m		[32m@code = Code.find(params[:id])[m
[32m+[m		[32m@code.destroy[m
[32m+[m		[32mflash[:danger] = "Code was deleted"[m
[32m+[m		[32mredirect_to code_path[m
[32m+[m	[32mend[m
[32m+[m
 	def code_params[m
 		params.require(:code).permit(:code)[m
 	end[m
 [m
[32m+[m	[32mdef require_same_user[m
[32m+[m		[32mif !current_user.admin?[m
[32m+[m		[32mflash[:danger] = "You can only edit or delete your own codes"[m
[32m+[m		[32mrender 'new'[m
[32m+[m		[32mend[m
[32m+[m	[32mend[m
 end[m
[1mdiff --git a/app/models/code.rb b/app/models/code.rb[m
[1mindex d41dedd..b586c24 100644[m
[1m--- a/app/models/code.rb[m
[1m+++ b/app/models/code.rb[m
[36m@@ -1,4 +1,6 @@[m
 # Model for the codes[m
 class Code < ActiveRecord::Base[m
 		validates :code, presence: true[m
[32m+[m
[32m+[m
 end[m
[1mdiff --git a/app/views/codes/_form.html.erb b/app/views/codes/_form.html.erb[m
[1mindex a00e134..0bafcfb 100644[m
[1m--- a/app/views/codes/_form.html.erb[m
[1m+++ b/app/views/codes/_form.html.erb[m
[36m@@ -16,7 +16,11 @@[m [mEnter the secret sign up code in order to access the sign up page. Admins can pr[m
 		</div>[m
 		<div class = "form-group">[m
 			<div class="col-md-offset-2 col-md-12">[m
[31m-				<%= f.submit "Check code"  ,class: "btn btn-primary btn-lg"  %>[m
[32m+[m				[32m<% if logged_in? %>[m[41m[m
[32m+[m					[32m<%= f.submit "Create code",class: "btn btn-primary btn-lg"  %>[m[41m[m
[32m+[m				[32m<% else %>[m[41m[m
[32m+[m				[32m<%= f.submit "Check code" ,class: "btn btn-primary btn-lg"  %>[m[41m[m
[32m+[m				[32m<% end %>[m[41m[m
 				<%= link_to "Return to home page", root_path, class: "btn btn-danger btn-lg"%> [m
 			</div>[m
 		</div>[m
[1mdiff --git a/app/views/codes/index.html.erb b/app/views/codes/index.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..bbf7ebe[m
[1m--- /dev/null[m
[1m+++ b/app/views/codes/index.html.erb[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m<!--Displays the index page for the positions-->[m[41m[m
[32m+[m[32m<h1 align="center">All Valid Admin Codes</h1>[m[41m[m
[32m+[m[41m[m
[32m+[m[32m<div class="row hidden-print">[m[41m[m
[32m+[m	[32m<div class="col-md-12 center">[m[41m[m
[32m+[m		[32m<%= link_to "Create new codes", new_code_path, class: "btn btn-s btn-primary btn-top" %>[m[41m[m
[32m+[m	[32m</div>[m[41m[m
[32m+[m[32m</div>[m[41m[m
[32m+[m[32m<table class="table table-condensed bg-white sortable">[m[41m[m
[32m+[m	[32m<tr>[m[41m[m
[32m+[m		[32m<th>Codes</th>[m[41m[m
[32m+[m		[32m<th class="hidden-print">Actions</th>[m[41m[m
[32m+[m	[32m</tr>[m[41m[m
[32m+[m	[32m<!--Goes through each row in the DB and displays them in the table-->[m[41m[m
[32m+[m	[32m<% @codes.each do |c| %>[m[41m[m
[32m+[m	[32m<tr>[m[41m[m
[32m+[m		[32m<td><%= link_to c.code, code_path(c) %></td>[m[41m[m
[32m+[m	[32m</td>[m[41m[m
[32m+[m		[32m<td class="hidden-print">[m[41m[m
[32m+[m			[32m<%= link_to 'Delete', code_path(c), method: :delete, data: {confirm: "Delete admin code?"}, class: "btn btn-danger btn-xs" %></td>[m[41m[m
[32m+[m	[32m</tr>[m[41m[m
[32m+[m	[32m<% end %>[m[41m[m
[32m+[m[32m</table>[m[41m[m
[1mdiff --git a/app/views/codes/show.html.erb b/app/views/codes/show.html.erb[m
[1mdeleted file mode 100644[m
[1mindex 29c05d0..0000000[m
[1m--- a/app/views/codes/show.html.erb[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-show.html.erb[m
\ No newline at end of file[m
[1mdiff --git a/app/views/layouts/_navigation.html.erb b/app/views/layouts/_navigation.html.erb[m
[1mindex d7229a9..f00b16c 100644[m
[1m--- a/app/views/layouts/_navigation.html.erb[m
[1m+++ b/app/views/layouts/_navigation.html.erb[m
[36m@@ -41,12 +41,18 @@[m
           <ul class="dropdown-menu">[m
             <li><%= link_to "Edit profile", edit_user_path(current_user) %></li>[m
             <li><%= link_to "View profile", user_path(current_user) %></li>[m
[32m+[m[32m            <% if current_user.admin? %>[m[41m[m
[32m+[m[32m            <li>[m[41m[m
[32m+[m[32m            <%= link_to "Admin Codes", codes_path %>[m[41m[m
[32m+[m[41m              [m
[32m+[m[32m            </li>[m[41m[m
[32m+[m[32m            <% end %>[m[41m[m
           </ul>[m
         </li>[m
         <% else %>[m
         <ul class="nav navbar-nav navbar-right">[m
           <li><%= link_to "Log in", login_path %></li>[m
[31m-          <li><%= link_to "Sign up", 'secret_page/new' %></li>[m
[32m+[m[32m          <li><%= link_to "Sign up", new_code_path %></li>[m[41m[m
         </ul>[m
         <% end %>[m
       </ul>[m
[1mdiff --git a/app/views/users/_form.html.erb b/app/views/users/_form.html.erb[m
[1mindex 2b82512..22993b7 100644[m
[1m--- a/app/views/users/_form.html.erb[m
[1m+++ b/app/views/users/_form.html.erb[m
[36m@@ -31,19 +31,12 @@[m
 			</div>[m
 		</div>[m
 [m
[31m-		<div class="form-group">[m
[31m-			<div class="col-md-8 col-md-offset-2">[m
[31m-			<label>Admin Code*<%= p.text_field :admin_code, class: "form-control", placeholder: "Administrator code" %></label>[m
[31m-			</div>[m
[31m-		</div>[m
[31m-[m
 		<% if current_user && current_user.admin? %>[m
 		<div class="form-group">[m
 			<div class="col-md-8 col-md-offset-2">[m
 			<label>Admin<%= p.check_box :admin, class: "form-control checkbox" %></label>[m
 			</div>[m
 		</div>[m
[31m-[m
 		<% end %>[m
 		<div class="form-group">[m
 			<div class="col-md-offset-2 col-md-12">[m
[36m@@ -51,16 +44,8 @@[m
 				<%= link_to "Cancel", root_path, class: "btn btn-danger btn-lg" %>[m
 			</div>[m
 		</div>[m
[31m-		<% end %>[m
[32m+[m[41m		[m
 	</div>[m
 </div>[m
[31m-<% if current_user && current_user.admin? %>[m
[31m-	<footer>[m
[31m-		*The admin code is needed to sign up and create an account. Every admin has a different code. Please do not share this code with anyone other than the person who wants to create an account. This code is used to ensure that no one outside of the V.C.S.A. can create an account.[m
[31m-	</footer>[m
[31m-	<% else %>[m
[31m-		<footer>[m
[31m-			*Ask an administrator in order to provide you with an admin code.[m
[31m-		</footer>[m
 <% end %>[m
 [m
[1mdiff --git a/app/views/users/show.html.erb b/app/views/users/show.html.erb[m
[1mindex 357d741..bb6591b 100644[m
[1m--- a/app/views/users/show.html.erb[m
[1m+++ b/app/views/users/show.html.erb[m
[36m@@ -5,7 +5,6 @@[m
 		<h4>Username: <%= @user.username %></h4>[m
 		<% if @user.admin? && current_user.admin?%>[m
 		<h4>Admin User</h4>[m
[31m-		<h4> Your admin code is: <%= @user.admin_code %> <h4>[m
 		<% end %>[m
 		<%= link_to 'Edit Information', edit_user_path(@user), class: "btn btn-warning btn-md hidden-print" %>[m
 	</div>[m
