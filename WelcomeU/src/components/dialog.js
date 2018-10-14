import React from 'react';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import Slide from '@material-ui/core/Slide';
import Slider from './slider';

function Transition(props) {
  return <Slide direction="up" {...props} />;
}
const marks = {
  0: <strong>Couldn't understand or speak</strong>,
  25: "Can understand but can't speak",
  50: 'Can understand and speak little bit',
  75: 'Can communicate easily',
  100: 'Fluent',
};

// const EnglishSlider = () => (<div style={{width: 400, margin: 50 }}>
//   <p>Slider with marks, `step=null`</p>
//   <Slider min={0} marks={marks} step={null} onChange={(log) => console.log(log)} defaultValue={50} />
// </div>);

class AlertDialogSlide extends React.Component {
  state = {
    open: false,
  };

  componentDidMount() {
    this.setState({ open: true });
  }
  handleClickOpen = () => {
    this.setState({ open: true });
  };

  handleClose = () => {
    this.setState({ open: false });
  };

  render() {
    return (
      <div>
        <Dialog
          open={this.state.open}
          TransitionComponent={Transition}
          keepMounted
          onClose={this.handleClose}
          aria-labelledby="alert-dialog-slide-title"
          aria-describedby="alert-dialog-slide-description"
        >
          <DialogTitle id="alert-dialog-slide-title">
            {"Please indicate your proficiency with the English language."}
          </DialogTitle>
          <DialogContent>
            <Slider />
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleClose} color="primary">
              Continue
            </Button>
          </DialogActions>
        </Dialog>
      </div>
    );
  }
}

export default AlertDialogSlide;
