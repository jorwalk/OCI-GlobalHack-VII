import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import FormControl from '@material-ui/core/FormControl';

const styles = {
  root: {
    flexGrow: 1,
  },
  grow: {
    flexGrow: 1,
    color: 'white',
    fontSize: '26px'
  },
  login: {
    display: 'flex',
    flexDirection: 'row',
  },
  textField: {
    margin: '4px',
    color: 'white'
  }
};

function ButtonAppBar(props) {
  const { classes } = props;
  return (
    <div className={classes.root}>
      <AppBar position="static" color="primary">
        <Toolbar>
          <Typography variant="h6" className={classes.grow}>
            WelcomeU
          </Typography>
          <div id="google_translate_element"></div>
          <div>
          <FormControl className={classes.login}>
          <TextField
            inputProps={{style: {color: 'white'}}}
            InputLabelProps={{style: {color: 'white'}}}
            label="Name"
            className={classes.textField}
            margin="normal"
          />
          <TextField
          inputProps={{style: {color: 'white'}}}
          InputLabelProps={{style: {color: 'white'}}}
            label="Password"
            className={classes.textField}
            margin="normal"
          />
          </FormControl>
          </div>
          <Button style={{color: 'white'}}>Login</Button>
        </Toolbar>
      </AppBar>
    </div>
  );
}

ButtonAppBar.propTypes = {
  classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(ButtonAppBar);