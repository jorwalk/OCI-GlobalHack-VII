import React from 'react';
import Iframe from 'react-iframe';

class chatBot extends React.Component {

  state = { showIframe: false };

  toggleIframe = () => {
    this.setState({
      showIframe : !this.state.showIframe
    });
  }
  render() {
    if(!this.state.showIframe){
      return (<button onClick={this.toggleIframe}>Chat Bot</button>);
    }
    return (<div><button onClick={this.toggleIframe}>Chat Bot</button>
    <Iframe
    allow="microphone"
    width="350"
    height="430"
    url="https://console.dialogflow.com/api-client/demo/embedded/1b2f5acd-ce46-4cfb-9809-1aa29c9f872a" />
    </div>)
  }
}

export default chatBot;