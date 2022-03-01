import React from 'react'
class ReactHome extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      error:null,
      isLoaded: false,
      publishedRequests:null
    }
  }
  makePublishedRequestsApiCall = () => {
    fetch('http://localhost:3000/api/v1/requests/published')
      .then(response => response.json())
      .then(
        (jsonifiedResponse) => {
          this.setState({
            isLoaded: true,
            publishedRequests: jsonifiedResponse
          });
        })
        .catch((error) => {
          this.setState({
            isLoaded: true,
            error
          });
        });
  }
  componentDidMount() {
    this.makePublishedRequestsApiCall()
  }
  render(){
    const {error, isLoaded, publishedRequests} = this.state
    console.log("published requests", publishedRequests)
    if (error) {
      return <React.Fragment>Error: {error.message}</React.Fragment>;
    } else if (!isLoaded) {
      return <React.Fragment>Loading...</React.Fragment>;
    } else {
      return (
        <React.Fragment>
          <h1>Published Requests</h1>
          <ul>
            {publishedRequests.map((req) =>
             <div><h3>{req.content}</h3>
            </div>
            )}
          </ul>
        </React.Fragment>
      );
    }
  }
}
export default ReactHome;