package dao;

import db.DBConnector;
import entity.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    private static final String CREATE_ITEM_SQL = "INSERT INTO items (name, description, price, sold, category_id, date_added) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ITEM_BY_ID_SQL = "SELECT * FROM items WHERE id = ?";
    private static final String GET_ALL_ITEMS_SQL = "SELECT * FROM items";
    private static final String GET_ALL_ITEMS_SORTED_BY_SOLD_DESC_SQL = "SELECT * FROM items ORDER BY sold DESC";
    private static final String GET_ALL_ITEMS_SORTED_BY_DATE_ADDED_DESC_SQL = "SELECT * FROM items ORDER BY date_added DESC";
    private static final String GET_ALL_ITEMS_BY_CATEGORY = "SELECT * FROM items WHERE category_id = ?";

    private static final String UPDATE_ITEM_SQL = "UPDATE items SET name = ?, description = ?, price = ?, sold = ?, category_id = ?, date_added = ? WHERE id = ?";
    private static final String UPDATE_ITEM_INCREMENT_SOLD_SQL = "UPDATE items SET sold = sold + 1 WHERE id = ?";
    private static final String DELETE_ITEM_SQL = "DELETE FROM items WHERE id = ?";

    public void createItem(Item item) {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_ITEM_SQL);
            preparedStatement.setString(1, item.getName());
            preparedStatement.setString(2, item.getDescription());
            preparedStatement.setDouble(3, item.getPrice());
            preparedStatement.setInt(4, item.getSold());
            preparedStatement.setLong(5, item.getCategoryId());
            preparedStatement.setDate(6, item.getDate());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Item getItemById(long id) {
        try {
            Connection connection = DBConnector.getConnection();
            Item item = new Item();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ITEM_BY_ID_SQL);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setSold(resultSet.getInt("sold"));
                item.setCategoryId(resultSet.getLong("category_id"));
                item.setDate(resultSet.getDate("date_added"));
                return item;
            }
            return null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private List<Item> getAll(boolean sortBySoldDesc, boolean selectByCategory, boolean sortByDateDesc, long categoryId) {
        try {
            Connection connection = DBConnector.getConnection();
            List<Item> items = new ArrayList<>();
            PreparedStatement preparedStatement;
            if (sortBySoldDesc) {
                preparedStatement = connection.prepareStatement(GET_ALL_ITEMS_SORTED_BY_SOLD_DESC_SQL);
            } else if (selectByCategory) {
                preparedStatement = connection.prepareStatement(GET_ALL_ITEMS_BY_CATEGORY);
                preparedStatement.setLong(1, categoryId);
            } else if (sortByDateDesc) {
                preparedStatement = connection.prepareStatement(GET_ALL_ITEMS_SORTED_BY_DATE_ADDED_DESC_SQL);
            } else {
                preparedStatement = connection.prepareStatement(GET_ALL_ITEMS_SQL);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setPrice(resultSet.getDouble("price"));
                item.setSold(resultSet.getInt("sold"));
                item.setCategoryId(resultSet.getLong("category_id"));
                item.setDate(resultSet.getDate("date_added"));
                items.add(item);
            }
            return items;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Item> getAllItem() {
        return getAll(false, false, false, 0);
    }

    public List<Item> getAllItemSortedBySoldDesc() {
        return getAll(true, false, false, 0);
    }

    public List<Item> getAllItemByCategory(long categoryId) {
        return getAll(false, true, false, categoryId);
    }

    public List<Item> getAllItemSortedByDateDesc() {
        return getAll(false, false, true, 0);
    }

    public void updateItem(Item item) {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ITEM_SQL);
            preparedStatement.setString(1, item.getName());
            preparedStatement.setString(2, item.getDescription());
            preparedStatement.setDouble(3, item.getPrice());
            preparedStatement.setInt(4, item.getSold());
            preparedStatement.setLong(5, item.getCategoryId());
            preparedStatement.setDate(6, item.getDate());
            preparedStatement.setLong(7, item.getId());
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void incrementSold(long id) {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ITEM_INCREMENT_SOLD_SQL);
            preparedStatement.setLong(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteItem(long id) {
        try {
            Connection connection = DBConnector.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ITEM_SQL);
            preparedStatement.setLong(1, id);
            preparedStatement.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
