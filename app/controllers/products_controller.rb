<p id="notice"><%= notice %></p>

<p>
  <strong>Name:</strong>
  <%= @product.name %>
</p>

<p>
  <strong>Price:</strong>
  <%= @product.price %>
</p>

<!-- 追加箇所 開始 -->
<p>
  <strong>Image:</strong>
  <% if @product.image? %>
    <div class="thumbnail">
      <%= image_tag @product.image.url %>
    </div>
  <% end %>
</p>
<!-- 追加箇所 終了 -->

<%= link_to 'Edit', edit_product_path(@product) %> |
<%= link_to 'Back', products_path %>