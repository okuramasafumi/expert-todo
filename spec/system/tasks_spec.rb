require 'rails_helper'

RSpec.describe 'task system test', type: :system do
  let(:user) { create(:user) }
  describe 'Creating a task' do
    context 'when title is empty' do
      let(:title) { '' }
      it 're-renders new task page' do
        visit new_task_path(as: user)
        fill_in 'task[title]', with: title
        fill_in 'task[description]', with: 'bar'
        select '2017', from: 'task[due_date(1i)]'
        select '12', from: 'task[due_date(2i)]'
        select '1', from: 'task[due_date(3i)]'
        click_on '作成'
        expect(page).to have_content('New Task')
      end
    end

    context 'when title is not empty' do
      let(:title) { 'foo' }
      it 'creates new task and redirects task show' do
        visit new_task_path(as: user)
        fill_in 'task[title]', with: title
        fill_in 'task[description]', with: 'bar'
        select '2017', from: 'task[due_date(1i)]'
        select '12', from: 'task[due_date(2i)]'
        select '1', from: 'task[due_date(3i)]'
        click_on '作成'
        expect(page).to have_content(title).and have_current_path(tasks_path)
      end
    end
  end

  describe 'Editing a task' do
    let(:task) { create(:task, user: user) }
    let(:description) { '' }
    context 'when title is empty' do
      let(:title) { '' }
      it 're-renders edit page' do
        visit edit_task_path(task, as: user)
        fill_in 'task[title]', with: title
        fill_in 'task[description]', with: description
        click_on '作成'
        expect(page).to have_content('Editing Task')
      end
    end

    context 'when title is not empty' do
      let(:title) { 'foo' }
      it 'successfully updates the task' do
        visit edit_task_path(task, as: user)
        fill_in 'task[title]', with: title
        fill_in 'task[description]', with: description
        click_on '作成'
        expect(page).to have_content('foo').and have_content('Task was successfully updated')
        expect(page).to have_current_path(tasks_path)
      end
    end
  end

  describe 'Deleting a task' do
    before { create(:task, user: user) }
    it 'deletes the task' do
      visit tasks_path(as: user)
      first(:link, 'Destroy').click
      expect(Task.count).to eq(0)
    end
  end

  describe 'Closing an task' do
    before { create(:task, user: user) }
    it 'closes the task' do
      visit tasks_path(as: user)
      first(:link, 'Close').click
      expect(Task.first).to be_closed
    end
  end
end
