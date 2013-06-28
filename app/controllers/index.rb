get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  puts params
  Note.create(params[:note])
  redirect "/"
end



get "/all_notes" do
  @all_notes = Note.all
  erb :all_notes
end

get "/edit/:id" do
  p params
  p "8" * 80
  @note = Note.find(params[:id])
  erb :edit_note_by_id
end

put "/edit/:id" do
  note = Note.find(params[:id])
  note.update_attributes(params[:note])
  redirect "/all_notes" #how to redirect to the note
end

get "/delete/:id" do
  @note = Note.find(params[:id])
  @title = "confrirm you want to delete note <%= @note.id %>"
  erb :delete_note
end

delete "/delete/:id" do
  note = Note.find(params[:id])
  note.destroy
  redirect "/all_notes"
end

not_found do
  status 404
  erb :four
end
