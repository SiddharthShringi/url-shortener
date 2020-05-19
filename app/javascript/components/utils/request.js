import axios from "axios";

const HEADERS = {
  Accept: "application/json",
  "X-CSRF-TOKEN": document.querySelector('[name="csrf-token"]').content,
};

export function clientRequest(url, method, payload) {
  return axios({
    method: method,
    url: url,
    headers: HEADERS,
    data: payload,
  }).catch((error) => {
    return Promise.reject(error);
  });
}
