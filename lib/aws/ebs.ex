# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.EBS do
  @moduledoc """
  You can use the Amazon Elastic Block Store (EBS) direct APIs to directly
  read the data on your EBS snapshots, and identify the difference between
  two snapshots. You can view the details of blocks in an EBS snapshot,
  compare the block difference between two snapshots, and directly access the
  data in a snapshot. If you're an independent software vendor (ISV) who
  offers backup services for EBS, the EBS direct APIs make it easier and more
  cost-effective to track incremental changes on your EBS volumes via EBS
  snapshots. This can be done without having to create new volumes from EBS
  snapshots.

  This API reference provides detailed information about the actions, data
  types, parameters, and errors of the EBS direct APIs. For more information
  about the elements that make up the EBS direct APIs, and examples of how to
  use them effectively, see [Accessing the Contents of an EBS
  Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-accessing-snapshot.html)
  in the *Amazon Elastic Compute Cloud User Guide*. For more information
  about the supported AWS Regions, endpoints, and service quotas for the EBS
  direct APIs, see [Amazon Elastic Block Store Endpoints and
  Quotas](https://docs.aws.amazon.com/general/latest/gr/ebs-service.html) in
  the *AWS General Reference*.
  """

  @doc """
  Seals and completes the snapshot after all of the required blocks of data
  have been written to it. Completing the snapshot changes the status to
  `completed`. You cannot write new blocks to a snapshot after it has been
  completed.
  """
  def complete_snapshot(client, snapshot_id, input, options \\ []) do
    path_ = "/snapshots/completion/#{URI.encode(snapshot_id)}"
    {headers, input} =
      [
        {"ChangedBlocksCount", "x-amz-ChangedBlocksCount"},
        {"Checksum", "x-amz-Checksum"},
        {"ChecksumAggregationMethod", "x-amz-Checksum-Aggregation-Method"},
        {"ChecksumAlgorithm", "x-amz-Checksum-Algorithm"},
      ]
      |> AWS.Request.build_params(input)
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 202)
  end

  @doc """
  Returns the data in a block in an Amazon Elastic Block Store snapshot.
  """
  def get_snapshot_block(client, block_index, snapshot_id, block_token, options \\ []) do
    path_ = "/snapshots/#{URI.encode(snapshot_id)}/blocks/#{URI.encode(block_index)}"
    headers = []
    query_ = []
    query_ = if !is_nil(block_token) do
      [{"blockToken", block_token} | query_]
    else
      query_
    end
    case request(client, :get, path_, query_, headers, nil, options, nil) do
      {:ok, body, response} ->
        body =
          [
            {"x-amz-Checksum", "Checksum"},
            {"x-amz-Checksum-Algorithm", "ChecksumAlgorithm"},
            {"x-amz-Data-Length", "DataLength"},
          ]
          |> Enum.reduce(body, fn {header_name, key}, acc ->
            case List.keyfind(response.headers, header_name, 0) do
              nil -> acc
              {_header_name, value} -> Map.put(acc, key, value)
            end
          end)

        {:ok, body, response}

      result ->
        result
    end
  end

  @doc """
  Returns the block indexes and block tokens for blocks that are different
  between two Amazon Elastic Block Store snapshots of the same
  volume/snapshot lineage.
  """
  def list_changed_blocks(client, second_snapshot_id, first_snapshot_id \\ nil, max_results \\ nil, next_token \\ nil, starting_block_index \\ nil, options \\ []) do
    path_ = "/snapshots/#{URI.encode(second_snapshot_id)}/changedblocks"
    headers = []
    query_ = []
    query_ = if !is_nil(starting_block_index) do
      [{"startingBlockIndex", starting_block_index} | query_]
    else
      query_
    end
    query_ = if !is_nil(next_token) do
      [{"pageToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    query_ = if !is_nil(first_snapshot_id) do
      [{"firstSnapshotId", first_snapshot_id} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Returns the block indexes and block tokens for blocks in an Amazon Elastic
  Block Store snapshot.
  """
  def list_snapshot_blocks(client, snapshot_id, max_results \\ nil, next_token \\ nil, starting_block_index \\ nil, options \\ []) do
    path_ = "/snapshots/#{URI.encode(snapshot_id)}/blocks"
    headers = []
    query_ = []
    query_ = if !is_nil(starting_block_index) do
      [{"startingBlockIndex", starting_block_index} | query_]
    else
      query_
    end
    query_ = if !is_nil(next_token) do
      [{"pageToken", next_token} | query_]
    else
      query_
    end
    query_ = if !is_nil(max_results) do
      [{"maxResults", max_results} | query_]
    else
      query_
    end
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Writes a block of data to a block in the snapshot. If the specified block
  contains data, the existing data is overwritten. The target snapshot must
  be in the `pending` state.

  Data written to a snapshot must be aligned with 512-byte sectors.
  """
  def put_snapshot_block(client, block_index, snapshot_id, input, options \\ []) do
    path_ = "/snapshots/#{URI.encode(snapshot_id)}/blocks/#{URI.encode(block_index)}"
    {headers, input} =
      [
        {"Checksum", "x-amz-Checksum"},
        {"ChecksumAlgorithm", "x-amz-Checksum-Algorithm"},
        {"DataLength", "x-amz-Data-Length"},
        {"Progress", "x-amz-Progress"},
      ]
      |> AWS.Request.build_params(input)
    query_ = []
    case request(client, :put, path_, query_, headers, input, options, 201) do
      {:ok, body, response} ->
        body =
          [
            {"x-amz-Checksum", "Checksum"},
            {"x-amz-Checksum-Algorithm", "ChecksumAlgorithm"},
          ]
          |> Enum.reduce(body, fn {header_name, key}, acc ->
            case List.keyfind(response.headers, header_name, 0) do
              nil -> acc
              {_header_name, value} -> Map.put(acc, key, value)
            end
          end)

        {:ok, body, response}

      result ->
        result
    end
  end

  @doc """
  Creates a new Amazon EBS snapshot. The new snapshot enters the `pending`
  state after the request completes.

  After creating the snapshot, use [
  PutSnapshotBlock](https://docs.aws.amazon.com/ebs/latest/APIReference/API_PutSnapshotBlock.html)
  to write blocks of data to the snapshot.
  """
  def start_snapshot(client, input, options \\ []) do
    path_ = "/snapshots"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, 201)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, Poison.Parser.t(), Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "ebs"}
    host = build_host("ebs", client)
    url = host
    |> build_url(path, client)
    |> add_query(query)

    additional_headers = [{"Host", host}, {"Content-Type", "application/x-amz-json-1.1"}]
    headers = AWS.Request.add_headers(additional_headers, headers)

    payload = encode_payload(input)
    headers = AWS.Request.sign_v4(client, method, url, headers, payload)
    perform_request(method, url, payload, headers, options, success_status_code)
  end

  defp perform_request(method, url, payload, headers, options, nil) do
    case HTTPoison.request(method, url, payload, headers, options) do
      {:ok, %HTTPoison.Response{status_code: 200, body: ""} = response} ->
        {:ok, response}

      {:ok, %HTTPoison.Response{status_code: status_code, body: body} = response}
      when status_code == 200 or status_code == 202 or status_code == 204 ->
        {:ok, Poison.Parser.parse!(body, %{}), response}

      {:ok, %HTTPoison.Response{body: body}} ->
        error = Poison.Parser.parse!(body, %{})
        {:error, error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end

  defp perform_request(method, url, payload, headers, options, success_status_code) do
    case HTTPoison.request(method, url, payload, headers, options) do
      {:ok, %HTTPoison.Response{status_code: ^success_status_code, body: ""} = response} ->
        {:ok, %{}, response}

      {:ok, %HTTPoison.Response{status_code: ^success_status_code, body: body} = response} ->
        {:ok, Poison.Parser.parse!(body, %{}), response}

      {:ok, %HTTPoison.Response{body: body}} ->
        error = Poison.Parser.parse!(body, %{})
        {:error, error}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %HTTPoison.Error{reason: reason}}
    end
  end

  defp build_host(_endpoint_prefix, %{region: "local"}) do
    "localhost"
  end
  defp build_host(endpoint_prefix, %{region: region, endpoint: endpoint}) do
    "#{endpoint_prefix}.#{region}.#{endpoint}"
  end

  defp build_url(host, path, %{:proto => proto, :port => port}) do
    "#{proto}://#{host}:#{port}#{path}"
  end

  defp add_query(url, []) do
    url
  end
  defp add_query(url, query) do
    querystring = AWS.Util.encode_query(query)
    "#{url}?#{querystring}"
  end

  defp encode_payload(input) do
    if input != nil, do: Poison.Encoder.encode(input, %{}), else: ""
  end
end
