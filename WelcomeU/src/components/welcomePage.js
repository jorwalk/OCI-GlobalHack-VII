import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Button from '@material-ui/core/Button';
import welcomeMessage from '../constants/languages';
import {withRouter} from 'react-router-dom';
import Chatbot from './chatBot';

const styles = () => ({
  root: {
    flexGrow: 1,
    padding: '9%'
  },
  paper: {
    padding: 10,
    textAlign: 'center',
    color: 'black',
  },
  box: {
    display: 'flex',
  },
  buttonWrapper: {
    display: 'flex',
    flex: 1,
    margin: 'auto',
    padding: '1%',
  },
  button: {
    width: '90%',
    margin: 'auto',
    fontSize: '18px',
  },
});

const ButtonContainer = ({message, classes, history}) => (
  <div className={classes.buttonWrapper}>
    <Button
        onClick={() => {
        history.push('/join');
        }}
        style={{color: 'white'}}
        variant="contained"
        color="primary"
        disableRipple
        className={classes.button}
      >
        {message}
      </Button>
  </div>
)

function FullWidthGrid(props) {
  const { classes, history } = props;

  return (
    <div className={classes.root}>
      <Paper className={classes.box}>
      {welcomeMessage.map(m => (<ButtonContainer history={history} key={m.lang} message={m.message} classes={classes}/>))}
      </Paper>
      {<Chatbot />}
    </div>
  );
}

export default withStyles(styles)(withRouter(FullWidthGrid));