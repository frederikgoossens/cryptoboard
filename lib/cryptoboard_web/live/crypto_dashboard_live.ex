defmodule CryptoboardWeb.CryptoDashboardLive do
  use CryptoboardWeb, :live_view

  @mock_data [
    %{rank: 1, name: "Bitcoin", symbol: "BTC", price: "$68,001"},
    %{rank: 2, name: "Ethereum", symbol: "ETH", price: "$3,401"},
    %{rank: 3, name: "BNB", symbol: "BNB", price: "$600"},
    %{rank: 4, name: "Solana", symbol: "SOL", price: "$140"},
    %{rank: 5, name: "XRP", symbol: "XRP", price: "$0.52"},
    %{rank: 6, name: "Cardano", symbol: "ADA", price: "$0.43"},
    %{rank: 7, name: "Dogecoin", symbol: "DOGE", price: "$0.13"},
    %{rank: 8, name: "Toncoin", symbol: "TON", price: "$7.02"},
    %{rank: 9, name: "Avalanche", symbol: "AVAX", price: "$33"},
    %{rank: 10, name: "Polkadot", symbol: "DOT", price: "$7"}
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :cryptos, @mock_data)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8 max-w-4xl mx-auto">
      <h1 class="text-3xl font-bold mb-6">Top 10 Cryptocurrencies</h1>
      <table class="min-w-full border border-gray-300 rounded-lg overflow-hidden">
        <thead class="bg-gray-100">
          <tr>
            <th class="px-4 py-2 text-left">#</th>
            <th class="px-4 py-2 text-left">Name</th>
            <th class="px-4 py-2 text-left">Symbol</th>
            <th class="px-4 py-2 text-left">Price</th>
          </tr>
        </thead>
        <tbody>
          <%= for crypto <- @cryptos do %>
            <tr class="border-t">
              <td class="px-4 py-2"><%= crypto.rank %></td>
              <td class="px-4 py-2 font-medium"><%= crypto.name %></td>
              <td class="px-4 py-2 text-gray-600"><%= crypto.symbol %></td>
              <td class="px-4 py-2 text-green-600 font-semibold"><%= crypto.price %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
