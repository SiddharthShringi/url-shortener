import React from "react";
import axios from "axios";
import { clientRequest } from "./utils/request";

class Links extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      links: [],
    };
  }

  componentDidMount() {
    axios.get("/api/v1/links").then((res) => {
      this.setState({
        links: res.data.links,
      });
    });
  }

  handlePin = (short_url, pinned) => {
    let payload = {
      link: {
        pinned: !pinned,
      },
    };
    clientRequest(`/api/v1/links/${short_url}`, "put", payload).then((res) => {
      this.setState({ links: res.data.links });
    });
  };

  render() {
    const { links } = this.state;
    return (
      <div className="mt-6">
        <div className="row mt-6">
          <div className="col">
            <h3 className="text-secondary">List of Links</h3>
          </div>
        </div>
        <div className="row mt-4">
          <div className="col">
            <table className="table table-striped">
              <thead>
                <tr>
                  <th scope="col"></th>
                  <th scope="col">Original Url</th>
                  <th scope="col">Short Url</th>
                </tr>
              </thead>
              <tbody>
                {links &&
                  links.map((link, i) => {
                    return (
                      <tr key={link.id}>
                        <th scope="row">
                          {link.pinned ? (
                            <span
                              key={"pinned" + i}
                              onClick={() =>
                                this.handlePin(link.short_url, link.pinned)
                              }
                            >
                              <i className="fas fa-map-pin"></i>
                            </span>
                          ) : (
                            <span
                              key={"unPinned" + i}
                              onClick={() =>
                                this.handlePin(link.short_url, link.pinned)
                              }
                            >
                              <i
                                className="fas fa-map-pin"
                                style={{ color: "#c7c7c7" }}
                              ></i>
                            </span>
                          )}
                        </th>
                        <td>{link.url}</td>
                        <td>https://short.is/{link.short_url}</td>
                      </tr>
                    );
                  })}
                <tr></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default Links;
