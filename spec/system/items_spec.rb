require 'rails_helper'

RSpec.describe 'Item system test', type: :system do
  let(:user) { create(:user) }
  describe 'Creating an item' do
    context 'when title is empty' do
      let(:title) { '' }
      it 're-renders new item page' do
        visit new_item_path(as: user)
        fill_in 'item[title]', with: title
        fill_in 'item[description]', with: 'bar'
        select '2017', from: 'item[due_date(1i)]'
        select '12', from: 'item[due_date(2i)]'
        select '1', from: 'item[due_date(3i)]'
        click_on '作成'
        expect(page).to have_content('New Item')
      end
    end

    context 'when title is not empty' do
      let(:title) { 'foo' }
      it 'creates new item and redirects item show' do
        visit new_item_path(as: user)
        fill_in 'item[title]', with: title
        fill_in 'item[description]', with: 'bar'
        select '2017', from: 'item[due_date(1i)]'
        select '12', from: 'item[due_date(2i)]'
        select '1', from: 'item[due_date(3i)]'
        click_on '作成'
        expect(page).to have_content(title).and have_current_path(item_path(Item.first))
      end
    end
  end

  describe 'Editing an item' do
    let(:item) { create(:item, user: user) }
    let(:description) { '' }
    context 'when title is empty' do
      let(:title) { '' }
      it 're-renders edit page' do
        visit edit_item_path(item, as: user)
        fill_in 'item[title]', with: title
        fill_in 'item[description]', with: description
        click_on '作成'
        expect(page).to have_content('Editing Item')
      end
    end

    context 'when title is not empty' do
      let(:title) { 'foo' }
      it 'successfully updates the item' do
        visit edit_item_path(item, as: user)
        fill_in 'item[title]', with: title
        fill_in 'item[description]', with: description
        click_on '作成'
        expect(page).to have_content('foo').and have_content('Item was successfully updated').and have_current_path(item_path(item))
      end
    end
  end

  describe 'Deleting an item' do
    before { create(:item, user: user) }
    it 'deletes the item' do
      visit items_path(as: user)
      first(:link, 'Destroy').click
      expect(Item.count).to eq(0)
    end
  end

  describe 'Closing an item' do
    before { create(:item, user: user) }
    it 'closes the item' do
      visit items_path(as: user)
      first(:link, 'Close').click
      expect(Item.first).to be_closed
    end
  end
end
