# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.IoT1ClickProjects do
  @moduledoc """
  The AWS IoT 1-Click Projects API Reference
  """

  @doc """
  Associates a physical device with a placement.
  """
  def associate_device_with_placement(client, device_template_name, placement_name, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}/devices/#{URI.encode(device_template_name)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, nil)
  end

  @doc """
  Creates an empty placement.
  """
  def create_placement(client, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Creates an empty project with a placement template. A project contains zero
  or more placements that adhere to the placement template defined in the
  project.
  """
  def create_project(client, input, options \\ []) do
    path_ = "/projects"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Deletes a placement. To delete a placement, it must not have any devices
  associated with it.

  <note> When you delete a placement, all associated data becomes
  irretrievable.

  </note>
  """
  def delete_placement(client, placement_name, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, nil)
  end

  @doc """
  Deletes a project. To delete a project, it must not have any placements
  associated with it.

  <note> When you delete a project, all associated data becomes
  irretrievable.

  </note>
  """
  def delete_project(client, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, nil)
  end

  @doc """
  Describes a placement in a project.
  """
  def describe_placement(client, placement_name, project_name, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Returns an object describing a project.
  """
  def describe_project(client, project_name, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Removes a physical device from a placement.
  """
  def disassociate_device_from_placement(client, device_template_name, placement_name, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}/devices/#{URI.encode(device_template_name)}"
    headers = []
    query_ = []
    request(client, :delete, path_, query_, headers, input, options, nil)
  end

  @doc """
  Returns an object enumerating the devices in a placement.
  """
  def get_devices_in_placement(client, placement_name, project_name, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}/devices"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Lists the placement(s) of a project.
  """
  def list_placements(client, project_name, max_results \\ nil, next_token \\ nil, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements"
    headers = []
    query_ = []
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
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
  Lists the AWS IoT 1-Click project(s) associated with your AWS account and
  region.
  """
  def list_projects(client, max_results \\ nil, next_token \\ nil, options \\ []) do
    path_ = "/projects"
    headers = []
    query_ = []
    query_ = if !is_nil(next_token) do
      [{"nextToken", next_token} | query_]
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
  Lists the tags (metadata key/value pairs) which you have assigned to the
  resource.
  """
  def list_tags_for_resource(client, resource_arn, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :get, path_, query_, headers, nil, options, nil)
  end

  @doc """
  Creates or modifies tags for a resource. Tags are key/value pairs
  (metadata) that can be used to manage a resource. For more information, see
  [AWS Tagging
  Strategies](https://aws.amazon.com/answers/account-management/aws-tagging-strategies/).
  """
  def tag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    query_ = []
    request(client, :post, path_, query_, headers, input, options, nil)
  end

  @doc """
  Removes one or more tags (metadata key/value pairs) from a resource.
  """
  def untag_resource(client, resource_arn, input, options \\ []) do
    path_ = "/tags/#{URI.encode(resource_arn)}"
    headers = []
    {query_, input} =
      [
        {"tagKeys", "tagKeys"},
      ]
      |> AWS.Request.build_params(input)
    request(client, :delete, path_, query_, headers, input, options, nil)
  end

  @doc """
  Updates a placement with the given attributes. To clear an attribute, pass
  an empty value (i.e., "").
  """
  def update_placement(client, placement_name, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}/placements/#{URI.encode(placement_name)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, nil)
  end

  @doc """
  Updates a project associated with your AWS account and region. With the
  exception of device template names, you can pass just the values that need
  to be updated because the update request will change only the values that
  are provided. To clear a value, pass the empty string (i.e., `""`).
  """
  def update_project(client, project_name, input, options \\ []) do
    path_ = "/projects/#{URI.encode(project_name)}"
    headers = []
    query_ = []
    request(client, :put, path_, query_, headers, input, options, nil)
  end

  @spec request(AWS.Client.t(), binary(), binary(), list(), list(), map(), list(), pos_integer()) ::
          {:ok, Poison.Parser.t(), Poison.Response.t()}
          | {:error, Poison.Parser.t()}
          | {:error, HTTPoison.Error.t()}
  defp request(client, method, path, query, headers, input, options, success_status_code) do
    client = %{client | service: "iot1click"}
    host = build_host("projects.iot1click", client)
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
